require 'command'

describe Command do
  subject { described_class.parse(assembly, lookup_table) }

  let(:lookup_table) {{}}

  context 'with an address command' do
    let(:assembly) { '@0' }

    it 'assembles to an address command' do
      expect(subject.to_hack[0]).to eq('0')
    end

    describe 'address' do
      context do
        let(:assembly) { '@0' }

        specify do
          expect(subject.to_hack[1..15]).to eq('000000000000000')
        end
      end

      context do
        let(:assembly) { '@5' }

        specify do
          expect(subject.to_hack[1..15]).to eq('000000000000101')
        end
      end
    end
  end

  context 'with a straight computation command' do
    describe 'computation' do
      let(:assembly) { 'A=D+M' }

      it 'assembles to a computation command' do
        expect(subject.to_hack[0..2]).to eq('111')
      end
    end

    describe 'source' do
      context 'with A' do
        let(:assembly) { 'D=D+A' }

        specify do
          expect(subject.to_hack[3]).to eq('0')
        end
      end

      context 'with M' do
        let(:assembly) { 'D=M+D' }

        specify do
          expect(subject.to_hack[3]).to eq('1')
        end
      end
    end

    describe 'destination' do
      context 'with A' do
        let(:assembly) { 'A=D+M' }

        specify do
          expect(subject.to_hack[10..12]).to eq('100')
        end
      end

      context 'with AD' do
        let(:assembly) { 'AD=D+M' }

        specify do
          expect(subject.to_hack[10..12]).to eq('110')
        end
      end

      context 'with ADM' do
        let(:assembly) { 'ADM=D+M' }

        specify do
          expect(subject.to_hack[10..12]).to eq('111')
        end
      end
    end

    describe 'computation' do
      let(:assembly) { 'ADM=A-D;JEQ' }

      specify do
        expect(subject.to_hack[4..9]).to eq('000111')
      end
    end

    describe 'jump' do
      context 'without a jump command' do
        let(:assembly) { 'A=A+D' }

        it 'does not jump' do
          expect(subject.to_hack[13..15]).to eq('000')
        end
      end
      
      context 'with a jump command' do
        let(:assembly) { '0;JMP' }

        it 'assembles to a computation command' do
          expect(subject.to_hack[0..2]).to eq('111')
        end

        it 'jumps' do
          expect(subject.to_hack[13..15]).to eq('111')
        end
      end
    end
  end
end
